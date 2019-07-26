From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v5 01/24] drm: Include ddc adapter pointer in struct
 drm_connector
Date: Fri, 26 Jul 2019 14:18:26 +0200
Message-ID: <489b4283-c346-b2f3-0b20-3905b261049f@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <e82d6aca4f8abc95834c8a36c101d153518bb1ac.1563960855.git.andrzej.p@collabora.com>
 <20190726063759.GB6443@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190726063759.GB6443@ravnborg.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedeskto
List-Id: linux-tegra@vger.kernel.org

SGkgU2FtLAoKVyBkbml1IDI2LjA3LjIwMTkgb8KgMDg6MzcsIFNhbSBSYXZuYm9yZyBwaXN6ZToK
PiBIaSBBbmRyemVqLgo+IAo+IFBhdGNoIGxvb2tzIGdvb2QsIGJ1dCBvbmUga2VybmVsLWRvYyBk
ZXRhaWwuCj4gCgpUaGFua3MsIEkgd2lsbCBhZGRyZXNzIGJvdGggaXNzdWVzIHlvdSBmb3VuZCwg
aW4gdjYuCgpBbmRyemVqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
