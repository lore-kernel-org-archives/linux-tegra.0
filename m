From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 3/6] ARM: tegra: build localtimer support only when
 needed
Date: Sun, 4 Mar 2012 10:37:32 -0800
Message-ID: <20120304183732.GC31064@quad.lixom.net>
References: <1330721912-8694-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1330721912-8694-1-git-send-email-alan@signal11.us>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Ott <alan@signal11.us>
Cc: Colin Cross <ccross@android.com>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 02, 2012 at 03:58:32PM -0500, Alan Ott wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> It is possible to build a tegra kernel without localtimer
> support, so the tegra specific parts should only be built
> when that is indeed enabled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Alan Ott <alan@signal11.us>

Thanks, applied.

-Olof
