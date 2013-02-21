From: Prashant Gaikwad <pgaikwad@nvidia.com>
Subject: Re: [PATCH v7 00/12] Tegra114 clockframework
Date: Thu, 21 Feb 2013 18:28:19 +0530
Message-ID: <512619EB.4030103@nvidia.com>
References: <1360931849-7090-1-git-send-email-pdeschrijver@nvidia.com> <5123C6E7.9070407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5123C6E7.9070407@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Simon Glass <sjg@chromium.org>, Joseph Lo <josephl@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 20 February 2013 12:09 AM, Stephen Warren wrote:
> On 02/15/2013 05:36 AM, Peter De Schrijver wrote:
>> This is the seventh version of the Tegra114 clockframework. It is based on the
>> for-next branch of
>> git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git and
>> http://www.spinics.net/lists/arm-kernel/msg220452.html.
> Mike,
>
> I think it'd be prudent to take this series through the Tegra tree again
> for 3.10; patch 11 needs to go in as part of the series due to internal
> dependencies, and I'm slightly worried that other Tegra DT changes might
> conflict with that patch (if only for context). Taking this series (and
> any other Tegra clk driver changes for 3.10) through the Tegra tree
> could resolve that easily. Do you have a problem with that?
>
> If that's OK, can you stage the dependency Peter mentioned:
> http://www.spinics.net/lists/arm-kernel/msg220452.html
> into a stable branch for me to merge, obviously after 3.9-rc1 is out.
>
> Thanks.
>
> Prashant, could you provide a review/ack for this series too.

For the series

Reviewed-by: Prashant Gaikwad <pgaikwad@nvidia.com>


