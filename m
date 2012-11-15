From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 0/6] Device tree updates for host1x support
Date: Thu, 15 Nov 2012 15:26:30 -0700
Message-ID: <50A56C16.3090009@wwwdotorg.org>
References: <1353013679-16773-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353013679-16773-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/15/2012 02:07 PM, Thierry Reding wrote:
> This second version of this patch series splits the patches up into more
> logical chunks as requested by Stephen. Instead of renaming the matching
> parameters in the clock driver, this version renames the AUXDATA entries
> to match what the clock driver expects. Furthermore the host1x clock is
> initialized to 150 MHz instead of the unsupported 144 MHz.

Thanks very much. I have applied the series; DT changes to for-3.8/dt,
and the other changes to for-3.8/soc.
