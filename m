From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: fuse: Add custom SoC attributes
Date: Wed, 25 Mar 2020 12:45:28 +0000
Message-ID: <d007d8b1-6420-469a-18af-09088b8b8398@nvidia.com>
References: <20200320113716.6105-1-jonathanh@nvidia.com>
 <20200320151035.GB3706404@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200320151035.GB3706404@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 20/03/2020 15:10, Thierry Reding wrote:
> On Fri, Mar 20, 2020 at 11:37:16AM +0000, Jon Hunter wrote:
>> Add a custom SoC attribute for Tegra to expose the HIDREV register
>> contents to userspace via the sysfs. This register provides additional
>> details about the fabrication and versioning of the device. Exposing
>> this information is useful for identifying the exact device revision and
>> device type.
>>
>> Please note that the fields in this register vary depending on the Tegra
>> generation and so instead of exposing the individual fields, just expose
>> the entire contents of the register. Details of the register fields can
>> be found in the Technical Reference Manual for each Tegra device.
> 
> That seems a little suboptimal to me. It's pretty trivial for the kernel
> to distinguish between different SoC generations in order to know what
> the fields are. It's a lot more difficult for userspace to do so. Is the
> register completely different between SoC generations or just slightly?

It looks like only Tegra194 is different which is a shame.
Unfortunately, does not appear to be documented in the public TRM at the
moment. Hopefully we can fix that.

> Having individual fields exposed as individual attributes seems like it
> would make it a lot easier for userspace to get at the needed bits.

Yes that does make sense.

Jon

-- 
nvpublic
