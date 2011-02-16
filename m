From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [GIT PULL] Please merge ASoC's tegra-arch branch
Date: Wed, 16 Feb 2011 15:22:13 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5471@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Colin Cross (ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin,

Can you please merge the following into Tegra's for-next:

git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git tegra-arch

arch/arm/mach-tegra/include/mach/harmony_audio.h |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/include/mach/harmony_audio.h

This is necessary for the various patches I want to push that set up audio
related platform data etc.

Thanks.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
