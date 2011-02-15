From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] [tegra] Make syncpt routines accessible by drivers
Date: Mon, 14 Feb 2011 16:22:11 -0800
Message-ID: <AANLkTin+uxnM-u7N-+aXUzGVm7m2eXZKrenDbRPq1V-W@mail.gmail.com>
References: <1297726034-32762-1-git-send-email-achew@nvidia.com>
	<AANLkTinvpo=R1pjvykEZVXV08D+uXLJa=R8CDcMFWWpT@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F763816BD96CFB1@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F763816BD96CFB1-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Yeah, including the relative path was a bit of a hack since the nvhost
drivers needs some serious work before it's upstreamable.  A "right"
way to do this is to have the syncpt functions take an nvhost_device
pointer (or create helper functions that do that,) then expose those
functions in mach/nvhost.h.  This obviates the need for a global
nvhost_sycpt pointer.

-Erik

On Mon, Feb 14, 2011 at 4:08 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> If you want to use syncpts you should be an nvhost_driver link the d=
c.
>
> Looking at drivers/video/tegra/dc, I notice that it gets access to th=
e syncpt functions by using a relative path (../host/dev.h) to include =
dev.h, which in turn includes nvhost_syncpt.h (in drivers/video/tegra/h=
ost). =A0Is this proper form?
>
> This syncpt access is for a Tegra V4L2 driver, which will live in dri=
vers/media/video. =A0I was trying to avoid using relative paths for #in=
cludes. =A0I assumed that the header files in drivers/video/tegra/host =
were not meant to be publicly available to other drivers, which is why =
I looked for some precedent in how nvhost functions were made available=
 to other kernel drivers, hence I modeled this after nvmap.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
