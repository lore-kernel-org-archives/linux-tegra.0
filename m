From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 14:17:18 +0000
Message-ID: <201209261417.18883.arnd@arndb.de>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org> <20120926104421.GA7040@n2100.arm.linux.org.uk> <506307A0.7010701@am.sony.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <506307A0.7010701-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 26 September 2012, Tim Bird wrote:
> Will those of us not interested in a single kernel binary
> that works everywhere be able to configure an ARM kernel image
> without a lot of bloat?

I'm not aware of increase in code size from the single kernel
image yet. If you find something, let us know.

For the platforms that are being converted to multiplatform in
3.7, the kernel binary should be essentially the same between
building a single-platform kernel before the patches, and a
multiplatform kernel with only one platform enabled after the
patches.

We had to add a few indirect function pointers, e.g. for
SMP startup, but that overhead is measured in bytes, not
kilobytes.

	Arnd
