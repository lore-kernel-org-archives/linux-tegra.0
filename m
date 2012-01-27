From: "Bedia, Vaibhav" <vaibhav.bedia-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH v1 3/3] ARM: tegra: cpuidle driver for tegra
Date: Fri, 27 Jan 2012 09:09:33 +0000
Message-ID: <B5906170F1614E41A8A28DE3B8D121433179202C@DBDE01.ent.ti.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
 <1327594923-21822-4-git-send-email-pdeschrijver@nvidia.com>
 <20120126191134.GA23484@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120126191134.GA23484-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 27, 2012 at 00:41:34, Mark Brown wrote:
> On Thu, Jan 26, 2012 at 06:22:03PM +0200, Peter De Schrijver wrote:
> > CPUidle driver for tegra. In this version only LP3 (clockgating) is supported.
> 
> Are you aware of the work Rob Lee is doing on providing a common library
> for the ARM generic bits of cpuidle?  I really must convert the s3c64xx
> work I did on that over some time...

Slightly off-topic..

This is probably a bit early to ask but when it that likely to get merged?
I am working on cpuidle for AM33xx and if Rob's cpuidle consolidation is getting
merged soon I will try to use them in my baseline.
