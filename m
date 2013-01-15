From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 3/3 RFT] ARM: tegra: dts: seaboard: enable keyboard
Date: Tue, 15 Jan 2013 11:59:43 -0700
Message-ID: <50F5A71F.7010108@wwwdotorg.org>
References: <1358234689-18126-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1358234689-18126-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/15/2013 12:24 AM, Laxman Dewangan wrote:
> Enable tegra based keyboard controller and populate the key matrix for
> seaboard. The key matrix was originally on driver code which is removed
> to have clean driver. The key mapping is now passed through dts file.

Applied to Tegra's for-3.9/dt branch.
