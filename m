From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Wed, 06 Mar 2013 09:18:26 -0700
Message-ID: <51376C52.8050007@wwwdotorg.org>
References: <201302261023.26939.arnd@arndb.de> <20130226113538.GS17833@n2100.arm.linux.org.uk> <512CF87A.4090404@wwwdotorg.org> <20130226181114.GU17833@n2100.arm.linux.org.uk> <5130E757.6090500@wwwdotorg.org> <20130304063436.GB27241@tbergstrom-lnx.Nvidia.com> <20130304091600.GC27241@tbergstrom-lnx.Nvidia.com> <5134D50B.8060001@wwwdotorg.org> <20130305074047.GH27241@tbergstrom-lnx.Nvidia.com> <513624AA.4090207@wwwdotorg.org> <20130306081401.GN27241@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130306081401.GN27241-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Bo Yan <byan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2013 01:14 AM, Peter De Schrijver wrote:
...
> I was under the
> impression there is no way to know if you're running in secure mode
> or non-secure mode.

There's no ARM-architected way. Given Tegra's implementation, there are
apparently some registers that behave differently that we can use (e.g.
read value values in secure mode, 0xffffffff in non-secure etc.)
