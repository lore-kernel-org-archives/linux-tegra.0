From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: export clock names for debugging
Date: Thu, 26 Jun 2014 09:52:16 -0600
Message-ID: <53AC41B0.40307@wwwdotorg.org>
References: <1403797705-26910-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403797705-26910-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/26/2014 09:48 AM, Peter De Schrijver wrote:
> When writing a module for testing or debugging purposes, there is no way to
> get hold of clk handles. This patch solves this by exposing all valid clocks
> as clkdev's for the virtual device tegra-clk-debug.

This is to support clk_get_sys()?

I guess this seems fine, so feel free to apply it, but I slightly wonder
why not just include this change as part of the presumably local and
never-to-be-upstreamed test/dev module?
