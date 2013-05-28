From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH RESEND] ARM: tegra114: correctly output clk_32k
Date: Tue, 28 May 2013 09:19:21 -0600
Message-ID: <51A4CAF9.4000305@wwwdotorg.org>
References: <1369536991-6111-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369536991-6111-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 05/25/2013 08:56 PM, Alexandre Courbot wrote:
> Tegra has a blink timer register that allows to modulate the
> clk_32k clock before outputting it. Since clk_32k is presented to the
> kernel as a fixed clock, make sure this register does not tamper with
> the clock frequency and that clk_32k is outputted as-is, similarly to
> what is done on t20 and t30.

The patch subject here should be "clk: tegra:" rather than "ARM:
tegra114". I assume Mike can fix this up when applying it.
