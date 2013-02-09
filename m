From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] MAINTAINERS: add keyword "tegra" to Tegra section
Date: Fri, 08 Feb 2013 17:05:06 -0800
Message-ID: <1360371906.13487.9.camel@joe-AO722>
References: <1360353891-24210-1-git-send-email-swarren@wwwdotorg.org>
	 <1360370419.13487.8.camel@joe-AO722> <51159C96.5080505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51159C96.5080505@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: arm@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2013-02-08 at 17:47 -0700, Stephen Warren wrote:
> On 02/08/2013 05:40 PM, Joe Perches wrote:
> > On Fri, 2013-02-08 at 13:04 -0700, Stephen Warren wrote:
> >> (?<!in)tegra
> > 
> > This doesn't work well.   It matches too many
> > words like integral.
> 
> Hmmm. That's exactly what the (?<!in) negative look-behind assertion is
> attempting to avoid. It works fine here. Is there some dependency on
> Perl version or something? My Perl version is v5.14.2.

Integral matches

I don't see any issue with using a leading \b
