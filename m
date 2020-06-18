From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Date: Thu, 18 Jun 2020 18:07:14 +0300
Message-ID: <66767af4-748e-733e-65b2-1a5df9781a5e@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
 <20200617141706.GC3536291@ulmo>
 <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
 <a14c2791-83af-1cd0-1d15-0544a4bf490b@gmail.com>
 <20200617165008.GB3547875@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200617165008.GB3547875@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.06.2020 19:50, Thierry Reding пишет:
> On Wed, Jun 17, 2020 at 05:33:00PM +0300, Dmitry Osipenko wrote:
>> 17.06.2020 17:24, Dmitry Osipenko пишет:
>>> 17.06.2020 17:17, Thierry Reding пишет:
>>>> On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
>>>>> 12.06.2020 17:18, Thierry Reding пишет:
>>>>> ...
>>>>>> +patternProperties:
>>>>>> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
>>>>>> +  "^gpios(-[a-zA-Z0-9-]+)?$":
>>>>>> +    type: object
>>>>>> +    required:
>>>>>> +      - gpio-hog
>>>>>
>>>>> There are two problems here:
>>>>>
>>>>> 1. This naming limitation didn't exist before this patch, so it's not a
>>>>> part of the conversion.
>>>>>
>>>>> 2. GPIO core uses the node's name for the hog's name. Hence by imposing
>>>>> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
>>>>> which doesn't make much sense to me.
>>>>>
>>>>> Please explain the rationale of this change.
>>>>
>>>> We could probably do without this if we didn't enforce additional or
>>>> unevaluated properties. Because if we don't match on a pattern here then
>>>> all of those GPIO hog nodes would show up as "extra" properties and they
>>>> are currently not allowed. If we do allow them, then we can drop this,
>>>> but we then have no way to fail validation for whatever else somebody
>>>> might want to put into these device tree nodes.
>>>>
>>>> That said, I think additionalProperties can be a schema in itself, so
>>>> maybe there's a way to only allow additional properties if they are of
>>>> type object and have a gpio-hog property. I'll look into that.
>>>
>>> Isn't it possible to validate the additional properties by checking what
>>> properties they have?
>>>
>>> For example, if sub-node has a gpio-hog property then this sub-node is
>>> okay, otherwise fail.
>>>
>>
>> Ah, I haven't finished reading yours last sentence before started to
>> type :) Yes, it will be nice if we could avoid the naming limitation, or
>> at least change it to something like xxx-hog.
> 
> So according to the json-schema specification, both additionalProperties
> and unevaluatedProperties must be a valid JSON schema, which means they
> can be objects rather than just booleans. Unfortunately, dt-schema tools
> don't allow these to be objects, so the below currently fails with these
> tools at the moment.
> 
> I can make it work with the following patch against dt-schema.git:
> 
> --- >8 ---
> diff --git a/meta-schemas/keywords.yaml b/meta-schemas/keywords.yaml
> index ed543235d7e7..aa88f726ea3b 100644
> --- a/meta-schemas/keywords.yaml
> +++ b/meta-schemas/keywords.yaml
> @@ -79,7 +79,11 @@ properties:
>    additionalItems:
>      type: boolean
>    additionalProperties:
> -    type: boolean
> +    oneOf:
> +      - type: object
> +        allOf:
> +          - $ref: "#/definitions/sub-schemas"
> +      - type: boolean
>    allOf:
>      items:
>        $ref: "#/definitions/sub-schemas"
> @@ -140,7 +144,11 @@ properties:
>    type: true
>    typeSize: true
>    unevaluatedProperties:
> -    type: boolean
> +    oneOf:
> +      - type: object
> +        allOf:
> +          - $ref: "#/definitions/sub-schemas"
> +      - type: boolean
>    uniqueItems:
>      type: boolean
>  
> --- >8 ---
> 
> With that applied, I can make validation of gpio-hog nodes work without
> requiring the names to change, which incidentally will allow me to drop
> one of the fixup patches from the ARM/arm64 DTS series.
> 
> Here's a hunk that applies on top of this patch and makes this work.
> I'll squash it in for the next version.
> 
> --- >8 ---
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> index b2debdb0caff..3f8a9c988305 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
> @@ -57,13 +57,6 @@ properties:
>    interrupt-controller:
>      description: Marks the device node as an interrupt controller.
>  
> -patternProperties:
> -  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> -  "^gpios(-[a-zA-Z0-9-]+)?$":
> -    type: object
> -    required:
> -      - gpio-hog
> -
>  allOf:
>    - if:
>        properties:
> @@ -90,7 +83,10 @@ required:
>    - "#interrupt-cells"
>    - interrupt-controller
>  
> -unevaluatedProperties: false
> +unevaluatedProperties:
> +  type: object
> +  required:
> +    - gpio-hog
>  
>  examples:
>    - |
> --- >8 ---

Thank you for figuring this out! I see that the dt-schema tool is
already updated in the git, very nice!
