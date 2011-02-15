From: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/1] [tegra] Make syncpt routines accessible by drivers
Date: Mon, 14 Feb 2011 17:52:21 -0800
Message-ID: <643E69AA4436674C8F39DCC2C05F763816BD96CFB3@HQMAIL03.nvidia.com>
References: <1297726034-32762-1-git-send-email-achew@nvidia.com>
	<AANLkTinvpo=R1pjvykEZVXV08D+uXLJa=R8CDcMFWWpT@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F763816BD96CFB1@HQMAIL03.nvidia.com>
	<AANLkTin+uxnM-u7N-+aXUzGVm7m2eXZKrenDbRPq1V-W@mail.gmail.com>
	<643E69AA4436674C8F39DCC2C05F763816BD96CFB2@HQMAIL03.nvidia.com>
 <AANLkTi=aMA_OTgtw37jdDrSyMm4jmvpvFt5LpyyoG9PP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=aMA_OTgtw37jdDrSyMm4jmvpvFt5LpyyoG9PP-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Erik Gilling' <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > You're right about that global nvhost_syncpt pointer. =A0That=20
> drives me nuts as well. =A0Nevertheless, I'm not sure I'm=20
> knowledgeable enough to do the required work to do this the=20
> "right" way. =A0As far as I know, nvhost is a guaranteed=20
> singleton in practice (not in implementation), so while this=20
> is ugly, it will work fine for existing projects.
>=20
> If you feel uncomfortable making this change, I recommend you include
> the private header file the way the dc does.

Okay, I'll do it this way then.--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
