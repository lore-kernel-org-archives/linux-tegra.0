From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: select required CPU and L2 errata options
Date: Thu, 5 Jan 2012 10:46:02 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F172B@HQMAIL01.nvidia.com>
References: <1325719752-818-1-git-send-email-olof@lixom.net>
 <6121078.4q2inFFXlB@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6121078.4q2inFFXlB@fb07-iapwap2>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Thursday, January 05, 2012 9:30 AM:
> Am Mittwoch, 4. Januar 2012, 15:29:12 schrieb Olof Johansson:
> > Only one of the L2 erratas are needed on T30, but T20/25
> > needs a few more.
> 
> can we have a word from someone from NVIDIA about which Tegra versions/revisions need
> which erratum applied?

Well, I can tell you easily which CPU revisions the various Tegra have.
According to our internal wiki:

Tegra20: CPU r1p1, PL310 r2p0 
Tegra30: CPU A01=r2p7/A02+=r2p9, NEON r2p3-50, PL310 r3p1-50 

You should be able to work out which errata are needed using the ARM
documentation.

-- 
nvpublic
