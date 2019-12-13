From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/25] drm/panel: add backlight support
Date: Fri, 13 Dec 2019 14:30:54 +0100
Message-ID: <CACRpkdaVYeJme0O8CW-heTmf3-0EHowFwcOAyy3jx13gjfj4zA@mail.gmail.com>
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-3-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191207140353.23967-3-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Purism Kernel Team <kernel@puri.sm>, Linux-Ren
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 7, 2019 at 3:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Panels often supports backlight as specified in a device tree.
> Update the drm_panel infrastructure to support this to
> simplify the drivers.
>
> With this the panel driver just needs to add the following to the
> probe() function:
>
>     err = drm_panel_of_backlight(panel);
>     if (err)
>             return err;
>
> Then drm_panel will handle all the rest.
>
> There is one caveat with the backlight support.
> If drm_panel_(enable|disable) are called multiple times
> in row then backlight_(enable|disable) will be called multiple times.
>
> The above will happen when a panel drivers unconditionally
> calls drm_panel_disable() in their shutdown() function,
> whan the panel is already disabled and then shutdown() is called.
>
> Reading the backlight code it seems safe to call
> the backlight_(enable|disable) several times.
>
> v3:

v3 looks good to me +/- Laurent's comments:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
