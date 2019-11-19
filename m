From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial
 IDs
Date: Tue, 19 Nov 2019 19:56:08 +0300
Message-ID: <8cff3af3-42c7-3312-5f98-cd5eb98b7b7a@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com> <20191119062535.GC2462695@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119062535.GC2462695@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 09:25, Thierry Reding пишет:
> On Mon, Nov 18, 2019 at 11:02:26PM +0300, Dmitry Osipenko wrote:
>> Define interconnect IDs for memory controller (MC), external memory
>> controller (EMC), external memory (EMEM) and memory clients of display
>> controllers (DC).
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  include/dt-bindings/interconnect/tegra-icc.h | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h


Hello Thierry,

> There was a bit of discussion regarding this for a recent patch that I
> was working on, see:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=140318

Thank you very much for the link.

> I'd rather not use an additional set of definitions for this. The memory
> controller already has a set of native IDs for memory clients that I
> think we can reuse for this.

I missed that it's fine to have multiple ICC connections defined
per-path, at quick glance looks like indeed it should be fine to re-use
MC IDs.

> I've only added these client IDs for Tegra194 because that's where we
> need it to actually describe a specific hardware quirk, but I can come
> up with the equivalent for older chips as well.

Older Tegra SoCs have hardware units connected to MC through AHB bus,
like USB for example. These units do not have MC client IDs and there is
no MC ID defined for the AHB bus either, but probably it won't be a
problem to define IDs for them if will be necessary.
