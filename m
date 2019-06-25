From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 25 Jun 2019 07:37:23 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B9D7024@DE02WEMBXB.internal.synopsys.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
 <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
 <26cfaeff-a310-3b79-5b57-fd9c93bd8929@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8DD9@DE02WEMBXB.internal.synopsys.com>
 <b66c7578-172f-4443-f4c3-411525e28738@nvidia.com>
 <d96f8bea-f7ef-82ae-01ba-9c97aec0ee38@nvidia.com>
 <6f36b6b6-8209-ed98-e7e1-3dac0a92f6cd@nvidia.com>
 <7f0f2ed0-f47c-4670-d169-25f0413c1fd3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7f0f2ed0-f47c-4670-d169-25f0413c1fd3@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQoNCj4gQW55IGZ1cnRoZXIg
ZmVlZGJhY2s/IEkgYW0gc3RpbGwgc2VlaW5nIHRoaXMgaXNzdWUgb24gdG9kYXkncyAtbmV4dC4N
Cg0KQXBvbG9naWVzIGJ1dCBJIHdhcyBpbiBGVE8uDQoNCklzIHRoZXJlIGFueSBwb3NzaWJpbGl0
eSB5b3UgY2FuIGp1c3QgZGlzYWJsZSB0aGUgZXRoWCBjb25maWd1cmF0aW9uIGluIA0KdGhlIHJv
b3RmcyBtb3VudCBhbmQgbWFudWFsbHkgY29uZmlndXJlIGl0IGFmdGVyIHJvb3RmcyBpcyBkb25l
ID8NCg0KSSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIGluIHdoaWNoIGNvbmRpdGlvbnMgdGhpcyBp
cyBoYXBwZW5pbmcgKGlmIGluIA0KaWZkb3duIG9yIGlmdXApLg0KDQpUaGFua3MsDQpKb3NlIE1p
Z3VlbCBBYnJldQ0K
