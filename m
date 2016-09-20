From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/4] ARM: tegra: nyan-big: Include compatible revisions
 for proper detection
Date: Tue, 20 Sep 2016 18:56:08 +0100
Message-ID: <d05b8e5a-adf7-9057-b42a-0da1fde84953@nvidia.com>
References: <20160828173246.32621-1-contact@paulk.fr>
 <20160828173246.32621-3-contact@paulk.fr>
 <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476@nvidia.com>
 <1474394004.1215.2.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474394004.1215.2.camel@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <contact@paulk.fr>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 20/09/16 18:53, Paul Kocialkowski wrote:
> * PGP Signed by an unknown key
> 
> Le mardi 20 septembre 2016 à 18:41 +0100, Jon Hunter a écrit :
>> On 28/08/16 18:32, Paul Kocialkowski wrote:
>>>
>>> Depthcharge (the payload used with cros devices) will attempt to detect
>>> boards using their revision. This includes all the known revisions for
>>> the nyan-big board so that the dtb can be selected preferably.
>>
>> May be I am missing something here, but for the mainline there is only
>> one dtb available and so why is this needed for the mainline?
> 
> There is indeed a single dts in mainline, but depthcharge will use the revision
> to match the compatible string (e.g. it will look for google,nyan-big-rev5, not
> google,nyan-big), so we need to list them all in that single dts. Otherwise,
> depthcharge will fall back to the default config, which may or may not be
> suitable for nyan.

Is tegra124-nyan-big.dtb not the default?

Jon

-- 
nvpublic
