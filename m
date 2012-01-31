From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/5] Add device tree support of audio (ALC5632) on PAZ00
 board
Date: Tue, 31 Jan 2012 10:00:45 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E124441@HQMAIL01.nvidia.com>
References: <1327994757-26950-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327994757-26950-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Leon Romanovsky wrote at Tuesday, January 31, 2012 12:26 AM:
> The following patchset is going to:
> 	* add device tree support of audio (ALC5632) on PAZ00 board.
> 	* enable headset autodetection.
> 	* enable headset microphone.

Aside from the issue I already comment on, the series:

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(Olof may wish to comment on whether he wishes the patches split up to
apply the Tegra/ASoC parts separately, or merge them into both trees,
to avoid any potential merge conflicts on the .dts files)

-- 
nvpublic
