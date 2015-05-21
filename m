From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH libdrm] tegra: Add VIC clear test
Date: Thu, 21 May 2015 15:58:10 +0100
Message-ID: <CACvgo53boXjv1Pf2AhpJ3Ro55g92z0-TRz-ihHuLKqVrXFT=_w@mail.gmail.com>
References: <1432214320-27077-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432214320-27077-1-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arto,

On 21 May 2015 at 14:18, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This patch adds a simple test for testing Video-Image-Compositor
> engine on Tegra124 SoC. The test case opens a channel and performs
> a surface clear.
>
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  tests/tegra/Makefile.am  |   3 +-
>  tests/tegra/host1x.h     |  52 ++++++
>  tests/tegra/submit_vic.c | 315 +++++++++++++++++++++++++++++++++++
>  tests/tegra/vic.h        | 426 +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 795 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tegra/host1x.h
>  create mode 100644 tests/tegra/submit_vic.c
>  create mode 100644 tests/tegra/vic.h
>

Please add the two new headers into the noinst_HEADERS list like
below. Otherwise they won''t end up in the tarball, thus the test will
fail to build.

diff --git a/tests/tegra/Makefile.am b/tests/tegra/Makefile.am
index 8e625c8..a771b32 100644
--- a/tests/tegra/Makefile.am
+++ b/tests/tegra/Makefile.am
@@ -11,3 +11,7 @@ LDADD = \

 noinst_PROGRAMS = \
        openclose \
        submit_vic
+
+noinst_HEADERS = \
+       host1x.h \
+       vic.h


Thanks
Emil
