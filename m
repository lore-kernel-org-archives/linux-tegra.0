From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 19:11:30 +0300
Message-ID: <6014fee9-ce97-7ced-f2ba-82176b8b36db@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
 <b7b77258-6309-7ed2-489d-337cf273ba1e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b7b77258-6309-7ed2-489d-337cf273ba1e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.04.2020 18:41, Sowjanya Komatineni пишет:
> 
> On 4/5/20 2:11 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>> ...
>>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>>> +{
>>> +     struct tegra_vi_channel *chan, *tmp;
>>> +     unsigned int port_num;
>>> +     unsigned int nchannels = vi->soc->vi_max_channels;
>>> +     int ret = 0;
>>> +
>>> +     for (port_num = 0; port_num < nchannels; port_num++) {
>>> +             /*
>>> +              * Do not use devm_kzalloc as memory is freed immediately
>>> +              * when device instance is unbound but application
>>> might still
>>> +              * be holding the device node open. Channel memory
>>> allocated
>>> +              * with kzalloc is freed during video device release
>>> callback.
>>> +              */
>>> +             chan = kzalloc(sizeof(*chan), GFP_KERNEL);
>> Why anyone would want to unbind this driver in practice?
>>
>> I think it should make more sense to set suppress_bind_attrs=true.
> 
> From the previous feedback of patch series, we need to support
> unbind/bind and looks like this driver should also support to built as a
> module.

If module unloading is also affected, then perhaps you should use
get/put_device() to not allow freeing the resources until they're still
in-use.

I suppose that it should be up to the V4L core to keep the device alive
while needed, rather than to put the burden to the individual drivers.
