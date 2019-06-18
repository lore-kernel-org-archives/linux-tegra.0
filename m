From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 18 Jun 2019 09:35:47 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
 <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQoNCj4gSSBhbSBzZWVpbmcg
YSBib290IHJlZ3Jlc3Npb24gb24gLW5leHQgZm9yIHNvbWUgb2Ygb3VyIGJvYXJkcyB0aGF0IGhh
dmUNCj4gYSBzeW5vcHN5cyBldGhlcm5ldCBjb250cm9sbGVyIHRoYXQgdXNlcyB0aGUgZHdtYWMt
ZHdjLXFvcy1ldGhlcm5ldA0KPiBkcml2ZXIuIEdpdCBiaXNlY3QgaXMgcG9pbnRpbmcgdG8gdGhp
cyBjb21taXQsIGJ1dCB1bmZvcnR1bmF0ZWx5IHRoaXMNCj4gY2Fubm90IGJlIGNsZWFubHkgcmV2
ZXJ0ZWQgb24gdG9wIG9mIC1uZXh0IHRvIGNvbmZpcm0uIA0KDQpUaGFua3MgZm9yIHJlcG9ydGlu
Zy4gTG9va3MgbGlrZSB0aGUgdGltZXIgaXMgbm90IHNldHVwIHdoZW4gDQpzdG1tYWNfdHhfY2xl
YW4oKSBpcyBjYWxsZWQuIFdoZW4gZG8geW91IHNlZSB0aGlzIHN0YWNrdHJhY2UgPyBBZnRlciAN
CmlmZG93biA/DQoNClRoYW5rcywNCkpvc2UgTWlndWVsIEFicmV1DQo=
