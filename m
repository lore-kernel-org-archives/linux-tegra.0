From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] reset: Add APIs to manage array of resets
Date: Tue, 04 Apr 2017 14:47:49 +0200
Message-ID: <1491310069.2996.17.camel@pengutronix.de>
References: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
         <1491226922-20307-3-git-send-email-vivek.gautam@codeaurora.org>
         <1491237384.2378.128.camel@pengutronix.de>
         <52efd58a-e4f2-d3a7-0145-4c2f60ef6dd6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52efd58a-e4f2-d3a7-0145-4c2f60ef6dd6@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, balbi@kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Vivek,

On Tue, 2017-04-04 at 16:09 +0530, Vivek Gautam wrote:
[...]
> > I'd prefer to mirror the gpiod API a little, and to have the number
> > contained in the array structure, similar to struct gpio_descs:
[...]
> Alright, i can update this.
> I took regulator_bulk interface as the reference, but now i see
> gpio_descs has a smaller footprint.

Ok, understood.
I think the smaller footprint API is more convenient for the user.

[...]
> >> + * Returns 0 on success or error number on failure
> >> + */
> >> +static int reset_control_array_get(struct device *dev, int num_rsts,
> >> +				struct reset_control_array *resets,
> >> +				bool shared, bool optional)
> > Can we make this count and return a pointer to the newly created array?
> >
> > static struct reset_controls *
> > reset_control_array_get(struct device *dev, bool shared, bool optional)
> > {
> > 	...
> >
> > That way the consumer doesn't have to care about counting and array
> > allocation.
> 
> Just trying to think again in line with the regulator bulk APIs.
> Can't a user provide a list of reset controls as data and thus
> request reset controls with a "id" and num_resets available.
> 
> e.g.
>     const char * const rst_names[] = {
>       "rst1", "rst2" ...
>     };
>     xyz_data = {
>       .resets = rst_names;
>       .num = ARRAY_SIZE(rst_names);
>     };
> and then the driver making use of reset_control_array APIs
> to request this list of reset controls and assert/deassert them.
> 
> I am assuming this case when one user driver is used across a bunch
> of platforms with different number of resets available.
> We may not want to rely solely on the device tree entries, since
> the resets can be mandatory in few cases and we may want to
> return failure.

The way I understood the array API was as a method of handling a list of
anonymous resets, specified as

	resets = <&reset 1>, <&reset 2>, <&reset 3>;
	// reset-names = "rst1", "rst2", "rst3"; /* don't care */

in the device tree.

Now if you want to handle a partial list of those as an unordered list,
with special consideration for others, that could be added as a separate
API when there is use for it. But I expect that most potential users of
this array API will not have to make such a distinction.

> >> @@ -85,6 +107,39 @@ static inline struct reset_control *__devm_reset_control_get(
> >>   	return -ENOTSUPP;
> >>   }
> >>   
> >> +static inline int reset_control_array_assert(int num_rsts,
> >> +				struct reset_control_array *resets)
> >> +{
> >> +	return 0;
> >> +}
> >> +
> >> +static inline int reset_control_array_deassert(int num_rsts,
> >> +				struct reset_control_array *resets)
> >> +{
> >> +	return 0;
> >> +}
> > Is this missing a stub for reset_control_array_get?
> 
> No, that's supposed to be a static function.

Oh right, it is static. Please ignore.

regards
Philipp
