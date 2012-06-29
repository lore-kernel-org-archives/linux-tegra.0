From: Prashant G <pgaikwad@nvidia.com>
Subject: Re: [PATCH 2/6] ARM: tegra20: Separate out clk ops and clk data
Date: Fri, 29 Jun 2012 07:36:48 +0530
Message-ID: <4FED0DB8.9080103@nvidia.com>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com> <1340879846-12900-3-git-send-email-pgaikwad@nvidia.com> <4FEC965F.4060104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FEC965F.4060104@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "mturquette@ti.com" <mturquette@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "ccross@android.com" <ccross@android.com>, "olof@lixom.net" <olof@lixom.net>
List-Id: linux-tegra@vger.kernel.org

On Thursday 28 June 2012 11:07 PM, Stephen Warren wrote:
> On 06/28/2012 04:37 AM, Prashant Gaikwad wrote:
>> Move clock initialization data to separate file. This is
>> required for migrating to generic clock framework if static
>> initialization is used.
>>
>> TODO: Add clock suspend/resume support
> Is the suspend/resume code something that was present in the existing
> Tegra clock code? If not, I'd be tempted to just drop that TODO line
> from the patch description when applying this.
It was there for Tegra20. I am planning to add it as part of 
suspend/resume support for both Tegra30 and Tegra20.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
