From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: disable host1x on multiplatform if Tegrais
 not selected
Date: Wed, 22 May 2013 15:02:06 -0600
Message-ID: <519D324E.9030905@wwwdotorg.org>
References: <c4e0a1015f6f1e2d5104dd3a7ef1a35f0a88bd72.1369253144.git.marvin24@gmx.de> <519D2638.8090203@wwwdotorg.org> <6893533.OPXKV14rt0@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6893533.OPXKV14rt0-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/22/2013 02:24 PM, Marc Dietrich wrote:
> Am Mittwoch, 22. Mai 2013, 14:10:32 schrieb Stephen Warren:
>> On 05/22/2013 02:07 PM, Marc Dietrich wrote:
>>> host1x needs Tegra clock support which is only enabled if ARCH_TEGRA
>>> is selected.
>>
>> You should send this patch to the drives/gpu maintainer and mailing list
>> (although perhaps Thierry sends pull requests for host1x?). And probably
>> explain why it's necessary.
> 
> Well, there is no drivers/gpu maintainer, maybe you meant drivers/gpu/drm, but 
> I don't know if host1x fits there. What's unclear in the patch description?

It looks like the MAINTAINERS entry wasn't updated when the host1x code
was added, and drivers/gpu/drm/tegra moved to drivers/gpu/host1x. I
guess Thierry is applying patches for this directory.

The commit description would typically mention the compile error that
this solves and/or exactly why Tegra clock support is needed, rather
than just the clock core which would typically provide all the APIs
drivers need.
