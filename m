From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/5] mfd: tps65910: Convert ti,system-power-controller
 DT property to poweroff-source
Date: Thu, 23 Oct 2014 11:02:21 +0100
Message-ID: <20141023100221.GA10395@x1>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
 <CABgxDoKus_D=ooCz3TqyXP9CTJUgbZVxQSsw4ZgBx1oYaTefbw@mail.gmail.com>
 <20141022155058.GN4939@x1>
 <CABgxDoJSLrAOMMA7=ZGd4F6z7_FkojCdjUNi52wbocZk7yJowQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABgxDoJSLrAOMMA7=ZGd4F6z7_FkojCdjUNi52wbocZk7yJowQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PERIER Romain <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "pawel.moll" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, galak <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, swarren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 23 Oct 2014, PERIER Romain wrote:

> 2014-10-22 17:50 GMT+02:00 Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > On Wed, 22 Oct 2014, PERIER Romain wrote:
> >
> >> This is related to the following subject "[RFC v3 PATCH 1/5] of: A=
dd
> >> standard property for poweroff capability" and depends on the
> >> corresponding patch.
> >
> > Then it should be sent in the same patch-set.
> >
> > There's nothing I can do with this patch as is.
> >
>=20
> Even if this patch is already commited and present in "linux-next" ?
> (or in Mark Brown's regulator tree)

Usually it wouldn't be possible to take this, as it would be
difficult to ensure bisectability.  The way we usually deal with this
is to have a shared immutable branch between the effected subsystems,
but we can only do this if the patches are sent as a set.  However, it
appears as though Mark has "of: Add standard property for poweroff
capability" on a tagged branch on its own.  This means, after checking
with Mark that this branch in indeed stable, I can merge it in and
base this commit on top of it.  Not many people setup their repos like
Mark does, so I guess you are lucky this time.

Once I've heard back from Mark, I'll let you know when I apply the
patch.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
