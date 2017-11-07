From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 04/10] gpu: host1x: Lock classes during job submission
Date: Tue, 7 Nov 2017 14:28:37 +0200
Message-ID: <ef08d3d8-94a7-8804-c339-5310719333f3@kapsi.fi>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-5-mperttunen@nvidia.com>
 <97ce4873-fdc1-5197-17bc-74505beadfc4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <97ce4873-fdc1-5197-17bc-74505beadfc4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05.11.2017 18:46, Dmitry Osipenko wrote:
> On 05.11.2017 14:01, Mikko Perttunen wrote:
 >> ...
>>
>> +static int mlock_id_for_class(unsigned int class)
>> +{
>> +#if HOST1X_HW >= 6
>> +	switch (class)
>> +	{
>> +	case HOST1X_CLASS_HOST1X:
>> +		return 0;
>> +	case HOST1X_CLASS_VIC:
>> +		return 17;
>
> What is the meaning of returned ID values that you have defined here? Why VIC
> should have different ID on T186?

On T186, MLOCKs are not "generic" - the HW knows that each MLOCK 
corresponds to a specific class. Therefore we must map that correctly.

>
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +#else
>> +	switch (class)
>> +	{
>> +	case HOST1X_CLASS_HOST1X:
>> +		return 0;
>> +	case HOST1X_CLASS_GR2D:
>> +		return 1;
>> +	case HOST1X_CLASS_GR2D_SB:
>> +		return 2;
>
> Note that we are allowing to switch 2d classes in the same jobs context and
> currently jobs class is somewhat hardcoded to GR2D.
>
> Even though that GR2D and GR2D_SB use different register banks, is it okay to
> trigger execution of different classes simultaneously? Would syncpoint
> differentiate classes on OP_DONE event?

Good point, we might need to use the same lock for these two.

>
> I suppose that MLOCK (the module lock) implies the whole module locking,
> wouldn't it make sense to just use the module ID's defined in the TRM?

Can you point out where these are defined?

Mikko
