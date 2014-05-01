From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 7/7] ARM: tegra: Add the EC i2c tunnel to tegra124-venice2
Date: Thu, 01 May 2014 13:06:17 -0600
Message-ID: <53629B29.3050702@wwwdotorg.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org> <1398879850-9111-8-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1398879850-9111-8-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, lee.jones@linaro.org, swarren@nvidia.com, wsa@the-dreams.de
Cc: abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, thierry.reding@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/30/2014 11:44 AM, Doug Anderson wrote:
> This adds the EC i2c tunnel (and devices under it) to the
> tegra124-venice2 device tree.

I'll happily take this into the Tegra tree once the patch containing the
binding it uses is applied.
