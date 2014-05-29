From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/2] debugfs entries for Tegra clocks
Date: Thu, 29 May 2014 11:52:00 -0600
Message-ID: <538773C0.30906@wwwdotorg.org>
References: <1401295868-18697-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401295868-18697-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/28/2014 10:51 AM, Peter De Schrijver wrote:
> This patch set introduces the 'regs' debugfs entry which shows the
> contents of all registers related to a clock.

Would it be better to create a regmap object for the entire clock module
register space, and then get all the debugfs stuff for free?
