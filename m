From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 18 Jun 2019 09:46:57 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B9C8DD9@DE02WEMBXB.internal.synopsys.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
 <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
 <26cfaeff-a310-3b79-5b57-fd9c93bd8929@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26cfaeff-a310-3b79-5b57-fd9c93bd8929@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQoNCj4gSSBhbSBub3QgY2Vy
dGFpbiBidXQgSSBkb24ndCBiZWxpZXZlIHNvLiBXZSBhcmUgdXNpbmcgYSBzdGF0aWMgSVAgYWRk
cmVzcw0KPiBhbmQgbW91bnRpbmcgdGhlIHJvb3QgZmlsZS1zeXN0ZW0gdmlhIE5GUyB3aGVuIHdl
IHNlZSB0aGlzIC4uLg0KDQpDYW4geW91IHBsZWFzZSBhZGQgYSBjYWxsIHRvIG5hcGlfc3luY2hy
b25pemUoKSBiZWZvcmUgZXZlcnkgDQpuYXBpX2Rpc2FibGUoKSBjYWxscywgbGlrZSB0aGlzOg0K
DQppZiAocXVldWUgPCByeF9xdWV1ZXNfY250KSB7DQoJbmFwaV9zeW5jaHJvbml6ZSgmY2gtPnJ4
X25hcGkpOw0KCW5hcGlfZGlzYWJsZSgmY2gtPnJ4X25hcGkpOw0KfQ0KDQppZiAocXVldWUgPCB0
eF9xdWV1ZXNfY250KSB7DQoJbmFwaV9zeW5jaHJvbml6ZSgmY2gtPnR4X25hcGkpOw0KCW5hcGlf
ZGlzYWJsZSgmY2gtPnR4X25hcGkpOw0KfQ0KDQpbIEkgY2FuIHNlbmQgeW91IGEgcGF0Y2ggaWYg
eW91IHByZWZlciBdDQoNClRoYW5rcywNCkpvc2UgTWlndWVsIEFicmV1DQo=
