From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: Use PMC scratch register 40 for tegra_resume()
 location store
Date: Mon, 22 Dec 2014 09:17:45 -0700
Message-ID: <54984429.8040905@wwwdotorg.org>
References: <1419202392-1159-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1419202392-1159-1-git-send-email-digetx@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Joseph Lo <josephl@nvidia.com>
Cc: stable@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Christoffer Dall <christoffer.dall@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12/21/2014 03:52 PM, Dmitry Osipenko wrote:
> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") changed tegra_resume()
> location storing from late to early and as result broke suspend on tegra20.
> PMC scratch register 41 was used by tegra lp1 suspend core code for storing
> physical memory address of common resume function and in the same time used by
> tegra20 cpuidle driver for storing cpu1 "resettable" status, so it implied
> strict order of scratch register use. Fix it by using scratch 40 instead of 41
> for tegra_resume() location store.

You likely can't simply change the PMC scratch register usage 
arbitrarily; specific registers are designated for specific purposes, 
and code outside the Linux kernel (bootloaders, LP0 resume code, secure 
monitors, etc.) may depend on those specific values being in those 
registers. Without significant research, I'd suggest not changing the 
PMC scratch register usage.
