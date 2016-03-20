From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: Add documentation for GM20B GPU
Date: Sun, 20 Mar 2016 15:55:49 +0900
Message-ID: <CAAVeFuKQvjb20aEh9_MBnrzEUjKoVc8yQu3a4Ego6Qaqe70M6A@mail.gmail.com>
References: <1458010724-10945-1-git-send-email-acourbot@nvidia.com>
 <1458010724-10945-4-git-send-email-acourbot@nvidia.com> <20160318204748.GA20243@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160318204748.GA20243@rob-hp-laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Mar 19, 2016 at 5:47 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Mar 15, 2016 at 11:58:42AM +0900, Alexandre Courbot wrote:
>> GM20B's definition is mostly similar to GK20A's, but requires an
>> additional clock.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 27 ++++++++++++++++++++--
>>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> One nit below.
>
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>> index 1e3748337319..d9ad6b87fbbc 100644
>> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>> @@ -1,9 +1,10 @@
>> -NVIDIA GK20A Graphics Processing Unit
>> +NVIDIA Tegra Graphics Processing Units
>>
>>  Required properties:
>>  - compatible: "nvidia,<gpu>"
>>    Currently recognized values:
>>    - nvidia,gk20a
>> +  - nvidia,gm20b
>>  - reg: Physical base address and length of the controller's registers.
>>    Must contain two entries:
>>    - first entry for bar0
>> @@ -19,6 +20,9 @@ Required properties:
>>  - clock-names: Must include the following entries:
>>    - gpu
>>    - pwr
>> +If the compatible string is "nvidia,gm20b", then the following clock
>> +is also required:
>> +  - ref
>>  - resets: Must contain an entry for each entry in reset-names.
>>    See ../reset/reset.txt for details.
>>  - reset-names: Must include the following entries:
>> @@ -27,7 +31,7 @@ Required properties:
>>  Optional properties:
>>  - iommus: A reference to the IOMMU. See ../iommu/iommu.txt for details.
>>
>> -Example:
>> +Example for GK20A:
>>
>>       gpu@0,57000000 {
>>               compatible = "nvidia,gk20a";
>> @@ -45,3 +49,22 @@ Example:
>>               iommus = <&mc TEGRA_SWGROUP_GPU>;
>>               status = "disabled";
>>       };
>> +
>> +Example for GM20B:
>> +
>> +     gpu@0,57000000 {
>
> Drop the comma and leading zero.

Even though this is how it appears in the actual DT?
