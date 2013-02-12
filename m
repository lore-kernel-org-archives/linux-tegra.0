From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [v2 3/3] ARM: tegra: Unify Device tree board files
Date: Tue, 12 Feb 2013 22:25:58 +0000
Message-ID: <201302122225.58322.arnd@arndb.de>
References: <5119849B.1070300@wwwdotorg.org> <201302121732.14960.arnd@arndb.de> <511AAB81.4000306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <511AAB81.4000306@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "marvin24@gmx.de" <marvin24@gmx.de>, "balbi@ti.com" <balbi@ti.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 12 February 2013, Stephen Warren wrote:
> I believe U-Boot enabled -ffunction-sections -fdata-sections or similar
> (recently?) to get this kind of behaviour. I wonder why the kernel
> didn't need that. Perhaps -O2 is more aggressive (within a file at
> least) than I thought.

-ffunction-sections works across files, while the trick I described
only works on file static symbols. David Woodhouse at some point
had a working kernel build with -ffunction-sections but for some
reason that never got merged.

	Arnd
