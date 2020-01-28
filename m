From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Tue, 28 Jan 2020 22:27:00 +0300
Message-ID: <d56618e1-8940-65ae-381e-796e44bcf537@gmail.com>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <20200127122115.GA2117209@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200127122115.GA2117209@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.01.2020 15:21, Thierry Reding пишет:
> On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
>> 21.01.2020 18:54, Thierry Reding пишет:
>>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
>>>> On 1/21/20 16:10, Thierry Reding wrote:
> [...]
>>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
>>>>> going to be the same and it's arbitrarily defined, so it's effectively
>>>>> useless. But other than that it looks good.
>>>>
>>>> Well, in most cases the target would be the EMEM, so that's fine. I have seen
>>>> that other vendors that may have an additional internal memory, especially
>>>> dedicated to some DSPs and in such cases the bandwidth needs are different for
>>>> the two paths (to internal memory and DDR).
>>>
>>> Most chips have a small internal memory that can be used, though it
>>> seldomly is. However, in that case I would expect the target to be a
>>> completely different device, so it'd look more like this:
>>>
>>> 	interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
>>> 			...;
>>>
>>> I don't think EMEM has any "downstream" other than external memory.
>>
>> The node ID should be mandatory in terms of interconnect, even if it's a
>> single node. EMC (provider) != EMEM (endpoint).
> 
> I don't understand why. An ID only makes sense if you've got multiple
> endpoints. For example, a regulator is a provider with a single endpoint
> so we don't specify an ID.

Because this is how ICC binding is defined, unless I'm missing something.

> By its very definition an ID is used to identify something and we use it
> with a phandle to create a unique pair that identifies a resource within
> whatever the phandle represents, with the goal to differentiate it from
> other resources within the same provider. However, if there's only one
> such resource, the ID becomes redundant because the phandle without an
> ID is already unique and there's no need to differentiate with an extra
> ID.

Georgi, do you think it is possible to support what Thierry is asking for?
