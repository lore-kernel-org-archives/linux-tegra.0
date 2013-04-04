From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: Add missing cdev1 and cdev2 clocks
Date: Thu, 04 Apr 2013 12:18:59 -0600
Message-ID: <515DC413.8050600@wwwdotorg.org>
References: <1365066333-2361-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365066333-2361-1-git-send-email-pgaikwad@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 03:05 AM, Prashant Gaikwad wrote:
> Register cdev1 and cdev2 peripheral clocks.

Can you please explain the relationship between the following clocks:

cdev1
extern1
clk_out1

The latter two clocks already exist in this driver. I think that
clk_out1 is meant to represent cdev1 already, although it's set up to
point at some PMC registers, rather than the CAR CLK_ENB registers.
