From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Only 1 CPU on Jetson TX1
Date: Mon, 27 Mar 2017 11:03:55 -0600
Message-ID: <e974016b-c495-8a56-7c5e-46fa273d472e@wwwdotorg.org>
References: <20170323001131.GA7507@jirafa.cyrius.com>
 <6da81dbc-b070-da0f-1589-ec2cb8f453d5@kapsi.fi>
 <20170326224912.GD4723@jirafa.cyrius.com>
 <fe29c677-584f-fd1f-d2f8-ff29c8bebf9c@wwwdotorg.org>
 <20170327165824.GA10278@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170327165824.GA10278-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/27/2017 10:58 AM, Thierry Reding wrote:
> On Mon, Mar 27, 2017 at 09:39:43AM -0600, Stephen Warren wrote:
>> On 03/26/2017 04:49 PM, Martin Michlmayr wrote:
>>> * Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> [2017-03-25 10:32]:
>>>> It appears you need to have
>>>>
>>>>   fdt_copy_node_names=/cpus:/psci
>>>>   fdt_copy_src_addr=0x83080000
>>>>
>>>> in your U-Boot configuration. This is documented somewhere in the middle of
>>>> http://elinux.org/Jetson/TX1_Upstream_Kernel.
>>>
>>> I can confirm that this works with u-boot from L4T R24.2.1.
>>>
>>> However, it doesn't work with mainling u-boot (grepping for fdt_copy_
>>> doesn't show anything in the source code).
>>>
>>> Does anyone know how to get all 4 CPUs working with mainline u-boot?
>>
>> Thierry, Jon, do you know?
>>
>> The "fdt_copy" feature of U-Boot isn't upstreamed since I thought it was
>> only required to boot the L4T kernel, not mainline. We're also reworking L4T
>> so this feature won't be needed there either, so I don't expect to upstream
>> "fdt_copy".
>
> I vaguely remember that we had discussed this a while ago and I think we
> decided that we should hardcode the /psci and /cpus nodes within the DTS
> file on the basis that firmware would be considered part of the hardware
> as far as the device tree description of it is concerned.
>
> Technically, hard-coding isn't quite correct because someone might end
> up not using the firmware that ships with L4T and therefore not have a
> working PSCI implementation, but I think it's fairly unlikely that
> someone will do that.

It seems reasonable to expect PSCI, so hard-coding seems fine to me. If 
someone does something unusual (like bringing up a new FW) they can 
always temporarily adjust the default DT to suit their needs.

Equally, relying on copying the /psci and /cpus nodes from the 
nvtboot-supplied DT likely doesn't avoid this assumption, since IIRC 
those nodes are simply hard-coded into the DT that nvtboot uses anyway.
