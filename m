From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V17 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 18:17:37 +0000
Message-ID: <BYAPR12MB339810D394AC0A50934DD5EAC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549648195-3989-1-git-send-email-skomatineni@nvidia.com>
 <1549648195-3989-3-git-send-email-skomatineni@nvidia.com>
 <0c30dfe0-1174-0056-5ef6-432b75de2353@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <0c30dfe0-1174-0056-5ef6-432b75de2353@gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "wsa@the-dreams.de" <wsa@the-dreams.de>, "peda@axentia.se" <peda@axentia.se>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2FkYXB0ZXJfcXVpcmtzIHRlZ3JhMTk0X2ky
Y19xdWlya3MgPSB7DQo+ID4gIAkuZmxhZ3MgPSBJMkNfQVFfTk9fWkVST19MRU4sDQo+ID4gKwku
bWF4X3dyaXRlX2xlbiA9IDY1NTM1IC0gSTJDX1BBQ0tFVF9IRUFERVJfU0laRSwNCj4NCj4gSWRl
YWxseSBpdCBzaG91bGQgYmUgU1pfNjRLIC0gSTJDX1BBQ0tFVF9IRUFERVJfU0laRSB0byBub3Qg
bWlzcyB0aGUgb25lIGJ5dGUsIG90aGVyd2lzZSBnb29kIHRvIG1lOg0KPg0KPiBSZXZpZXdlZC1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPg0KDQpXaXRoIFNaXzY0SyAtIEky
Q19QQUNLRVRfSEVBRFJfU2l6ZSwgV2hlbiB3ZSBjb21wdXRlIGRtYV9idWZfc2l6ZSA9IG1heF93
cml0ZV9sZW4gKyBJMkNfUEFDS0VUX0hFQURFUl9TSVpFLCBkbWFfYnVmX3NpemUgd2lsbCBiZSBT
Wl82NEsgd2hpY2ggaXMgMHgxMDAwMCBhcGJkbWEgZG1hIGNvdW50IGxpbWl0IHNob3VsZCBiZSA8
IDY0SyBtZWFuaW5nIDY1NTM1IG1heCBpcyBhbGxvd2VkDQo=
