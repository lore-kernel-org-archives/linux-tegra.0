From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] nouveau: arm: Add MODULE_FIRMWARE for gk20a
Date: Wed, 11 Nov 2015 10:29:13 +0100
Message-ID: <CABr+WTmG1p6-dGGpWJgGBAJydyWz=2aPj-e93X9metn8y8Qrcg@mail.gmail.com>
References: <1443452893-18246-1-git-send-email-kwizart@gmail.com>
 <CAAVeFuJLJO4LvLqq2w9gMe6V6L3VDi+Gz59GvwKF2v8OWTWgBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1514111369=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJLJO4LvLqq2w9gMe6V6L3VDi+Gz59GvwKF2v8OWTWgBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============1514111369==
Content-Type: multipart/alternative; boundary=001a1143b40c9aef54052440751a

--001a1143b40c9aef54052440751a
Content-Type: text/plain; charset=UTF-8

2015-09-30 6:57 GMT+02:00 Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> On Tue, Sep 29, 2015 at 12:08 AM, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> > This patch is needed by initramfs tools to detect
> > the required firmware files for the module.
> >
> > This patch tests for either TEGRA_124_SOC or TEGRA_132_SOC
> > for the firmwares related to the Tegra K1 generation.
> >
> > v2: move the MODULE_FIRMWARE to the nvidia_platform.c file.
> >  This will avoid to test for NOUVEAU_PLATFORM_DRIVER
>
> Nice, thanks for doing this change!
>
> Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>

Thx for the review.
FYI I've tested the patch on top of 4.3+ kernels, and the initramfs
generated with dracut works as expected.

Is there any other concern with this patch ?

It's certainly late for 4.4,I would expect it to hit kernel 4.3 at some
point, but I don't think everything is wired from userspace(Xorg/Wayland)
wrt dGPU support.
So It could also wait for 4.5.
What do you think ?

Thx

-- 
-

Nicolas (kwizart)

--001a1143b40c9aef54052440751a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2015=
-09-30 6:57 GMT+02:00 Alexandre Courbot <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span>:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span>On Tue, Sep 29, 2015 at 12:08 AM, Ni=
colas Chauvet &lt;<a href=3D"mailto:kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">kw=
izart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; This patch is needed by initramfs tools to detect<br>
&gt; the required firmware files for the module.<br>
&gt;<br>
&gt; This patch tests for either TEGRA_124_SOC or TEGRA_132_SOC<br>
&gt; for the firmwares related to the Tegra K1 generation.<br>
&gt;<br>
&gt; v2: move the MODULE_FIRMWARE to the nvidia_platform.c file.<br>
&gt;=C2=A0 This will avoid to test for NOUVEAU_PLATFORM_DRIVER<br>
<br>
</span>Nice, thanks for doing this change!<br>
<br>
Reviewed-by: Alexandre Courbot &lt;<a href=3D"mailto:acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" t=
arget=3D"_blank">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Thx for the review.=
<br>FYI I&#39;ve tested the patch on top of 4.3+ kernels, and the initramfs=
 generated with dracut works as expected.<br></div><div class=3D"gmail_extr=
a"><br>Is there any other concern with this patch ?<br><br></div><div class=
=3D"gmail_extra">It&#39;s certainly late for 4.4,I would expect it to hit k=
ernel 4.3 at some point, but I don&#39;t think everything is wired from use=
rspace(Xorg/Wayland) wrt dGPU support.<br></div><div class=3D"gmail_extra">=
So It could also wait for 4.5.<br></div><div class=3D"gmail_extra">What do =
you think ?<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Thx<br></div><div class=3D"gmail_extra"><br>-- <br><div><div dir=
=3D"ltr"><div>-<br><br></div>Nicolas (kwizart)<br></div></div>
</div></div>

--001a1143b40c9aef54052440751a--

--===============1514111369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1514111369==--
