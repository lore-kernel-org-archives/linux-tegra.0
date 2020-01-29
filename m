From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver
 for Tegra210
Date: Wed, 29 Jan 2020 08:25:03 -0800
Message-ID: <8bf0ab06-a37e-4816-86e2-805b46787d5a@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
 <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
 <20200129100906.GE2479935@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200129100906.GE2479935@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Helen Koike <helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 1/29/20 2:09 AM, Thierry Reding wrote:
> On Tue, Jan 28, 2020 at 02:13:17PM -0800, Sowjanya Komatineni wrote:
>> On 1/28/20 1:45 PM, Helen Koike wrote:
> [...]
>>> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
> [...]
>>>> +const struct tegra_csi_fops csi2_fops = {
>>>> +     .hw_init = csi2_hw_init,
>>>> +     .csi_start_streaming = csi2_start_streaming,
>>>> +     .csi_err_status = csi2_error_status,
>>>> +};
>>> If I saw correctly, you don't have other instances of struct tegra_csi_fops with different functions.
>>> So why not exposing the functions directly instead of creating a global variable?
>> Currently driver supports Tegra210 only. Later we will add for Tegra186 and
>> Tegra184 support too where we will have separate csi fops.
> Perhaps this structure should be prefixed with a tegra210_ to make that
> more obvious?
Will fix prefix in v2
>>>> +EXPORT_SYMBOL(csi2_fops);
> Also, why do we need to export these? These will be built as linked into
> the Tegra VI driver, which is the only one that uses these, right? Would
> it not be enough to just make it global? Why the need to export?
>
> Thierry
Will fix in v2
