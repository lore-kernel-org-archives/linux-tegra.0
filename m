From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Date: Tue, 10 Dec 2019 22:33:48 +0100
Message-ID: <CACRpkdZ7jg7JwNk12m9pGXOVBxHRta8nBWmpdqFvfQHB=8LptA@mail.gmail.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
 <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Abhinav Kumar <abhinavk@codeaurora.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Purism Kernel Team <kernel@puri.sm>Linux-Renesas <lin>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 4, 2019 at 9:16 AM Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:

> > On the DSI displays in video mode there is also this EOL area
> > which seems to be where the logic is normally just idling for a
> > while, that can be adjusted on some hardware as well, but
> > I don't quite understand it admittedly. Sometimes I wonder if
> > anyone really understands DSI... :/
>
> I'm not aware of any EOL area in MIPI-DSI that would make the hardware
> idle, don't you mean LP-11?

I think in the spec the bubble used for this is tagged "BLLP"
Blanking-Line-Low-Power or something.

IIUC it is possible for displays to either receive continuous NULL
packets or blanking packets or go to LP mode in this area.

And since that is not there for e.g. DPI displays I feel it adds
another layer of confusion to timings.

Yours,
Linus Walleij
