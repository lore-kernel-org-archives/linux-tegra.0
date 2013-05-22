From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: disable host1x on multiplatform if Tegrais not selected
Date: Wed, 22 May 2013 22:24:52 +0200
Message-ID: <6893533.OPXKV14rt0@fb07-iapwap2.physik.uni-giessen.de>
References: <c4e0a1015f6f1e2d5104dd3a7ef1a35f0a88bd72.1369253144.git.marvin24@gmx.de> <519D2638.8090203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519D2638.8090203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, 22. Mai 2013, 14:10:32 schrieb Stephen Warren:
> On 05/22/2013 02:07 PM, Marc Dietrich wrote:
> > host1x needs Tegra clock support which is only enabled if ARCH_TEGRA
> > is selected.
> 
> You should send this patch to the drives/gpu maintainer and mailing list
> (although perhaps Thierry sends pull requests for host1x?). And probably
> explain why it's necessary.

Well, there is no drivers/gpu maintainer, maybe you meant drivers/gpu/drm, but 
I don't know if host1x fits there. What's unclear in the patch description?

Marc
