

# 安装Go
GO='go1.9.linux-amd64.tar.gz'
cd ~
tar -C /usr/local -xzf $GO
rm $GO

# 安装Python36
PYTHON='Python-3.6.2'
cd ~
tar -xzf $PYTHON.tgz
cd $PYTHON
./configure --prefix=$HOME/Python3
make && make altinstall
cd ~ && rm -fr $PYTHON.tgz $PYTHON

# 使用 venv 创建虚拟环境 pyenv, 并加载环境
cd ~
./Python3/bin/python3.6 -m venv pyenv
source ~/pyenv/bin/activate

# 豆瓣的pip源
mkdir ~/.pip
echo "[global]
trusted-host = pypi.douban.com
index-url = http://pypi.douban.com/simple" >> ~/.pip/pip.conf

pip install ipython ansible
# 安装Scrapy, 因为Twisted没有python3.6的编译包, 所以要源码编译安装
wget https://pypi.python.org/packages/31/bf/7f86a8f8b9778e90d8b2921e9f442a8c8aa33fd2489fc10f236bc8af1749/Twisted-17.5.0.tar.bz2#md5=cd5c287802dcbaf7be15cf937c922b71
tar -xjf Twisted-17.5.0.tar.bz2
cd Twisted-17.5.0
# Twisted依赖
pip install zope.interface constantly incremental six attrs Automat hyperlink
python setup.py install
cd .. && rm -fr Twisted-17.5.0 Twisted-17.5.0.tar.bz2
pip install scrapy

# 更改zsh_prompt
sed '/^PROMPT/d' .oh-my-zsh/themes/robbyrussell.zsh-theme
cat zsh_prompt >> .oh-my-zsh/themes/robbyrussell.zsh-theme
