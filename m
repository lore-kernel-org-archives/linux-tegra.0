From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: fix compile warning in AC'97 driver
Date: Tue, 16 Jul 2013 11:00:44 -0600
Message-ID: <1373994044-15068-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This fixes the following by deleting dead code:

sound/soc/tegra/tegra20_ac97.c: In function =E2=80=98tegra20_ac97_platf=
orm_probe=E2=80=99:
sound/soc/tegra/tegra20_ac97.c:435:1: warning: label =E2=80=98err_unreg=
ister_pcm=E2=80=99 defined but not used [-Wunused-label]

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_a=
c97.c
index e58233f..87b845f 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -432,8 +432,6 @@ static int tegra20_ac97_platform_probe(struct platf=
orm_device *pdev)
=20
 	return 0;
=20
-err_unregister_pcm:
-	tegra_pcm_platform_unregister(&pdev->dev);
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
 err_asoc_utils_fini:
--=20
1.8.1.5
