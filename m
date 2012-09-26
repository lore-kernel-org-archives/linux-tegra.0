From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 14:49:48 +0000
Message-ID: <201209261449.48468.arnd@arndb.de>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org> <201209261417.18883.arnd@arndb.de> <506315A6.3090300@am.sony.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <506315A6.3090300-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 26 September 2012, Tim Bird wrote:
> My main issue is to avoid requiring the loading of
> drivers and features that are not required for a
> platform, if the platform does not need it (or the
> developer chooses to omit it).  I may have mis-read
> this thread, but it sounded like the uncompress
> code was going to be moved to a common area and
> not be configurable.

The suggestion was to move it into a different location, but you
still would only have one version of it, even for a multiplatform
kernel, so no code growth there.

Right now, a multiplatform kernel has no way of debugging the
decompressor using console output, so it's actually /smaller/
than a single-platform kernel, but also less capable.

Stephen's patches are a way to bring that feature back for
platforms that are converted to multiplatform, but such a kernel
would still only work on a single platform, even if it has
all the actual kernel code enabled to support others.

	Arnd
