From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [GIT PULL] ARM: tegra: DT-related fixes needed by the MMC tree
Date: Tue, 19 Mar 2013 10:24:38 -0600
Message-ID: <51489146.9090109@wwwdotorg.org>
References: <1363034651-21472-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1363034651-21472-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 02:44 PM, Stephen Warren wrote:
> In order to convert the Tegra MMC driver to using mmc_of_parse(), some
> bugs in the Tegra device-tree content need to be fixed first; it's
> currently wrong but unused, and mmc_of_parse() causes that data to be
> used for the first time.

Chris, I don't see this pull request nor the followup patch in the
mmc-next branch yet. Are you still planning on pulling it in? Let me
know if you need me to resend them. Thanks.
