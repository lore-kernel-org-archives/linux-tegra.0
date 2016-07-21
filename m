From: Mirza Krak <mirza.krak@gmail.com>
Subject: Re: [RFC 6/6] bus: Add support for Tegra NOR controller
Date: Thu, 21 Jul 2016 23:41:56 +0200
Message-ID: <CALw8SCV9ZV+OpuVz3r2dXGb55mC26es-Oe7HfZRCJgyxONRqTQ@mail.gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-7-git-send-email-mirza.krak@gmail.com> <222d4179-a72f-56d1-246b-ab66af3057d9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <222d4179-a72f-56d1-246b-ab66af3057d9@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org

2016-07-21 17:12 GMT+02:00 Jon Hunter <jonathanh@nvidia.com>:
>
> The reset is defined in the binding, but never used. Should we make sure
> the reset is de-asserted in the probe?

Yes, will do that.
