From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] [tegra] Make syncpt routines accessible by drivers
Date: Mon, 14 Feb 2011 17:49:54 -0800
Message-ID: <AANLkTi=aMA_OTgtw37jdDrSyMm4jmvpvFt5LpyyoG9PP@mail.gmail.com>
References: <1297726034-32762-1-git-send-email-achew@nvidia.com>
	<AANLkTinvpo=R1pjvykEZVXV08D+uXLJa=R8CDcMFWWpT@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F763816BD96CFB1@HQMAIL03.nvidia.com>
	<AANLkTin+uxnM-u7N-+aXUzGVm7m2eXZKrenDbRPq1V-W@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F763816BD96CFB2@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F763816BD96CFB2-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 14, 2011 at 4:47 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Yeah, including the relative path was a bit of a hack since the nvho=
st
>> drivers needs some serious work before it's upstreamable. =A0A "righ=
t"
>> way to do this is to have the syncpt functions take an nvhost_device
>> pointer (or create helper functions that do that,) then expose those
>> functions in mach/nvhost.h. =A0This obviates the need for a global
>> nvhost_sycpt pointer.
>>
>> -Erik
>
> You're right about that global nvhost_syncpt pointer. =A0That drives =
me nuts as well. =A0Nevertheless, I'm not sure I'm knowledgeable enough=
 to do the required work to do this the "right" way. =A0As far as I kno=
w, nvhost is a guaranteed singleton in practice (not in implementation)=
, so while this is ugly, it will work fine for existing projects.

If you feel uncomfortable making this change, I recommend you include
the private header file the way the dc does.

> Can we use nvmap as precedent and do it this way for now? =A0I'd like=
 to get the V4L2 camera host driver up to the Tegra community as soon a=
s possible. =A0When the problem is solved for the dc driver, I can adap=
t that to the V4L2 camera host driver.

nvmap (another piece of code that needs a lot of work before it's
upstream) is a horrible example to use as a precedent.  This whole
discussion is somewhat moot as you're building your driver against two
pieces that have no clear path to being upstreamed.  You are welcome
to make any changes you want in your own repository for supporing V4L2
but I won't be pulling this syncpt patch into
git://android.git.kernel.org/kernel/tegra.git.

-Erik
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
