From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Tegra194 HW Fixes
Date: Mon, 4 May 2020 13:46:13 +0530
Message-ID: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series proposes SW workarounds for Tegra194 HDA HW bugs.
Following are the two issues seen:
 1. GCAP register does not reflect true capability.
    The actual number of SDO lines is "4", where as it reflects "2".
 2. With 4 SDO line configuration playback fails for,
    44.1K/48K, 2-channel, 16-bps audio stream.

After fixing [1], issue [2] is uncovered.
As per recommendation by Tegra HW team the workarounds are pushed.

Testing done
============
 * Verify GCAP register after registering HDA sound card
 * Verify audio playback for 44.1K/48K, 2-channel, 16-bps.

Sameer Pujar (3):
  ALSA: hda/tegra: correct number of SDO lines for Tegra194
  ALSA: hda: add member to store ratio for stripe control
  ALSA: hda/tegra: workaround playback failure on Tegra194

 include/sound/hdaudio.h     |  3 +++
 sound/hda/hdac_controller.c | 11 ++++++++++
 sound/hda/hdac_stream.c     |  2 +-
 sound/pci/hda/hda_tegra.c   | 50 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.7.4
