From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] pinctrl: Pass all configs to driver on pin_config_set()
Date: Wed, 28 Aug 2013 13:44:59 +0200
Message-ID: <CACRpkdYVzXDRWFEa84LwN7fh9x1mK+7YOLeps51zcRHZCCowsQ@mail.gmail.com>
References: <1377134300-25480-1-git-send-email-syin@broadcom.com>
 <1377484899-4918-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1377484899-4918-1-git-send-email-syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>"linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <li>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 26, 2013 at 4:41 AM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:

> When setting pin configuration in the pinctrl framework, pin_config_set() or
> pin_config_group_set() is called in a loop to set one configuration at a time
> for the specified pin or group.
>
> This patch 1) removes the loop and 2) changes the API to pass the whole pin
> config array to the driver.  It is now up to the driver to loop through the
> configs.  This allows the driver to potentially combine configs and reduce the
> number of writes to pin config registers.
>
> All c files changed have been build-tested to verify the change compiles and
> that the corresponding .o is successfully generated.
>
> Signed-off-by: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
>   drivers/pinctrl/pinconf.c             |   42 ++++----
>   drivers/pinctrl/pinctrl-tegra.c       |   69 ++++++------
>   include/linux/pinctrl/pinconf.h       |    6 +-
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
>   On Tegra (Tegra114 Dalmore board, on top of next-20130816),
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> ---
> Please refer to the discussion with Linus W. "[PATCH] ARM: Adds pin config API
> to set all configs in one function" here:
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-May/166567.html
>
> All c files changed have been build-tested to verify the change compiles and
> that the corresponding .o are successfully generated.
>
> [v2]    rebased on LinusW's linux-pinctrl.git "devel" branch.  Fixed and build-
>         tested pinctrl-sunxi.c
> [v3]    rebased on linux-pinctrl.git:devel as of 2013.08.25. Applied API change
>         to new driver pinctrl-palmas.c. Re build-tested all files.


OK it appears to work flawlessly on ux500 as well, and with
Stephen's Tested-by and Laurent's ACK, there is really no
reason for me not to apply this right off. And no reason to
prolong this much needed change.

So patch applied for v3.12.

Let's see if something nasty happens in linux-next or this
is a go.

Yours,
Linus Walleij
