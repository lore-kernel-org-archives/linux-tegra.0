From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/4] Tegra patches for 2.6.40
Date: Mon, 25 Apr 2011 11:32:24 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04973BBB14@HQMAIL01.nvidia.com>
References: <1303408892-7472-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303408892-7472-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Thursday, April 21, 2011 12:01 PM:
> Below are the patches I have queued up for Tegra in 2.6.40.
> ...
> I tested:
> 
> * After applying these changes, everything builds OK and runs fine on
>   Harmony, including audio.
> * After additionally merging Mark's ASoC for-2.6.40/for-next branch,
>   there are no merge conflicts, everything builds OK, and everything
>   runs OK on Seaboard clamshell, including a full audio checkout.

>   Note that non-clamshell Seaboard has difficulty initializing I2C.
>   I'm investigating this, but don't expect to need to modify any of
>   these changes because of this issue; most likely some unrelated bug
>   needs fixing.

Note that I found the cause of this; please see my recent email titled
"[PATCH] i2c: tegra: Enable new slave mode." for this fix for this.

Thanks.

-- 
nvpublic
