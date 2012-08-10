From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: use IO_ADDRESS for getting virtual address
Date: Fri, 10 Aug 2012 10:48:50 -0600
Message-ID: <50253B72.5030209@wwwdotorg.org>
References: <1344603782-2541-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1344603782-2541-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: olof@lixom.net, linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/10/2012 07:03 AM, Laxman Dewangan wrote:
> Use macro IO_ADDRESS for getting virtual address of
> corresponding physical address to make the consistency
> with rest of Tegra code-base.
> This macro calls the IO_TO_VIRT() which is defined in
> arch/arm/mach-tegra/include/mach/iomap.h

Thanks, applied to Tegra's for-3.7/fixes.
