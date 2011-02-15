From: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/1] [tegra] Make syncpt routines accessible by drivers
Date: Mon, 14 Feb 2011 16:47:34 -0800
Message-ID: <643E69AA4436674C8F39DCC2C05F763816BD96CFB2@HQMAIL03.nvidia.com>
References: <1297726034-32762-1-git-send-email-achew@nvidia.com>
	<AANLkTinvpo=R1pjvykEZVXV08D+uXLJa=R8CDcMFWWpT@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F763816BD96CFB1@HQMAIL03.nvidia.com>
 <AANLkTin+uxnM-u7N-+aXUzGVm7m2eXZKrenDbRPq1V-W@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin+uxnM-u7N-+aXUzGVm7m2eXZKrenDbRPq1V-W-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Erik Gilling' <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> Yeah, including the relative path was a bit of a hack since the nvhos=
t
> drivers needs some serious work before it's upstreamable.  A "right"
> way to do this is to have the syncpt functions take an nvhost_device
> pointer (or create helper functions that do that,) then expose those
> functions in mach/nvhost.h.  This obviates the need for a global
> nvhost_sycpt pointer.
>=20
> -Erik

You're right about that global nvhost_syncpt pointer.  That drives me n=
uts as well.  Nevertheless, I'm not sure I'm knowledgeable enough to do=
 the required work to do this the "right" way.  As far as I know, nvhos=
t is a guaranteed singleton in practice (not in implementation), so whi=
le this is ugly, it will work fine for existing projects.

Can we use nvmap as precedent and do it this way for now?  I'd like to =
get the V4L2 camera host driver up to the Tegra community as soon as po=
ssible.  When the problem is solved for the dc driver, I can adapt that=
 to the V4L2 camera host driver.

> On Mon, Feb 14, 2011 at 4:08 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote=
:
> >> If you want to use syncpts you should be an nvhost_driver=20
> link the dc.
> >
> > Looking at drivers/video/tegra/dc, I notice that it gets=20
> access to the syncpt functions by using a relative path=20
> (../host/dev.h) to include dev.h, which in turn includes=20
> nvhost_syncpt.h (in drivers/video/tegra/host). =A0Is this proper form=
?
> >
> > This syncpt access is for a Tegra V4L2 driver, which will=20
> live in drivers/media/video. =A0I was trying to avoid using=20
> relative paths for #includes. =A0I assumed that the header=20
> files in drivers/video/tegra/host were not meant to be=20
> publicly available to other drivers, which is why I looked=20
> for some precedent in how nvhost functions were made=20
> available to other kernel drivers, hence I modeled this after nvmap.
> --
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
