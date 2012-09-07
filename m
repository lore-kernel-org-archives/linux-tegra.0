From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 1/4] Runtime Interpreted Power Sequences
Date: Fri, 7 Sep 2012 17:04:24 +0900
Message-ID: <1887927.1deN8M9siP@percival>
References: <1346412846-17102-1-git-send-email-acourbot@nvidia.com>
 <1346412846-17102-2-git-send-email-acourbot@nvidia.com>
 <201209061614.54022.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201209061614.54022.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Heiko,

On Thursday 06 September 2012 22:14:53 Heiko St=FCbner wrote:
> Hi Alexander,
> =

> Am Freitag, 31. August 2012, 13:34:03 schrieb Alexandre Courbot:
> > Some device drivers (panel backlights especially) need to follow precise
> > sequences for powering on and off, involving gpios, regulators, PWMs
> > with a precise powering order and delays to respect between each steps.
> > These sequences are board-specific, and do not belong to a particular
> > driver - therefore they have been performed by board-specific hook
> > functions to far.
> > =

> > With the advent of the device tree and of ARM kernels that are not
> > board-tied, we cannot rely on these board-specific hooks anymore but
> > need a way to implement these sequences in a portable manner. This patch
> > introduces a simple interpreter that can execute such power sequences
> > encoded either as platform data or within the device tree.
> > =

> > Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> =

> I really like this idea, also because I'll have to solve similar problems=
 on
> the way to dt for my tinker-platform.

Glad to read that! :)

> For your power_seq_run function you write that it simply returns an error
> code on failure and looking through it I also just found the error return
> statement. This would leave a device half turned on.
> =

> So I'm wondering, if it shouldn't turn off all the things it turned on un=
til
> the step that produced the error. All your possible step types (execpt the
> delay) are booleans, so it should be possible to simply negate them when
> backtracking through the previous steps.

Indeed, I think you raised an important point. Right now all step types are =

invertible, but we cannot rely on that statement to be true forever. For =

instance, one short-term improvement will be to allow finer regulator contr=
ol, =

like voltage setting. In this case, how can we go back to the initial state =

without recording it?

If e.g. the power on sequence fails at step N (of M steps for that sequence=
), =

one could try playing the corresponding power off sequence (either complete=
ly =

of from step M - N), but then again we cannot rely on sequences to be =

perfectly symetrical. Maybe this is more something for the calling driver t=
o =

check for and control?

Alex.
